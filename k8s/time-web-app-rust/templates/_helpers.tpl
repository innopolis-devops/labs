{{/*
Expand the name of the chart.
*/}}
{{- define "time-web-app-rust.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "time-web-app-rust.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "time-web-app-rust.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "time-web-app-rust.labels" -}}
helm.sh/chart: {{ include "time-web-app-rust.chart" . }}
{{ include "time-web-app-rust.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "time-web-app-rust.selectorLabels" -}}
app.kubernetes.io/name: {{ include "time-web-app-rust.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "time-web-app-rust.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "time-web-app-rust.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{- define "time-web-app-rust.environments" }}
- name: MY_USERNAME
  valueFrom:
    secretKeyRef:
      name: {{ include "time-web-app-rust.fullname" . }}-credentials
      key: user
- name: MY_PASSWORD
  valueFrom:
    secretKeyRef:
      name: {{ include "time-web-app-rust.fullname" . }}-credentials
      key: password
{{- end }}
