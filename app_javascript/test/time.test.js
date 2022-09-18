const timeFeature = require('../src/features/time')

// eslint-disable-next-line no-undef
test('gets current time for Moscow timezone, en-US locale', () => {
    let t = timeFeature.getCurrentTime("en-US", {timeZone: "Europe/Moscow"})
    // eslint-disable-next-line no-undef
    expect(t).toBe(new Date().toLocaleString("en-US", {timeZone: "Europe/Moscow"}))
})

// eslint-disable-next-line no-undef
test('gets current time for Moscow timezone, ru-RU locale', () => {
    let t = timeFeature.getCurrentTime("ru-RU", {timeZone: "Europe/Moscow"})
    // eslint-disable-next-line no-undef
    expect(t).toBe(new Date().toLocaleString("ru-RU", {timeZone: "Europe/Moscow"}))

})

// eslint-disable-next-line no-undef
test('gets current time for Chicago timezone', () => {
    /*  Test-driven Development: test for Chicago
        I didn't make the feature just yet (post-mvp feature 😎👍🏻), but I've already made the test for it */
    let t = timeFeature.getCurrentTime("en-US", {timeZone: "America/Chicago"})
    // eslint-disable-next-line no-undef
    expect(t).toBe(new Date().toLocaleString("en-US", {timeZone: "America/Chicago"}))
})