/**
 * general current time getting function
 * @param locales : string (example: "en-US")
 * @param options : object (example: {timeZone: "Europe/Moscow"})
 * @returns {string}
 */
function getCurrentTime(locales, options) {
    return new Date().toLocaleString(locales, options)
}

/**
 * Module responsible for all the business logic (use-cases) related to getting time
 * @type {{getMskTime(): string}}
 */
module.exports = {
    getCurrentTime, // added to exports for testing framework

    /**
     * use-case: current time specifically in moscow getting function
     * @returns {string}
     */
    getMskTime() {
        return getCurrentTime("en-US", {timeZone: "Europe/Moscow"})
    }
}