package main

import (
	"io"
	"net/http"
	"net/http/httptest"
	"strings"
	"testing"
	"time"

	"github.com/stretchr/testify/require"
)

func TestHandler(t *testing.T) {
	now := time.Now()
	t.Run("success", func(t *testing.T) {
		ts := httptest.NewServer(handler(func() time.Time { return now }))
		defer ts.Close()

		res, err := http.Get(ts.URL)
		require.NoError(t, err)
		defer res.Body.Close()

		require.Equal(t, http.StatusOK, res.StatusCode)

		bts, err := io.ReadAll(res.Body)
		require.NoError(t, err)

		require.Equal(t,
			strings.ReplaceAll(tmplText, "{{.}}",
				strings.ReplaceAll(now.Format(time.RFC3339Nano), "+", "&#43;"),
			),
			string(bts),
		)
	})
}
