import pytest
from selenium.webdriver.common.by import By
from selenium.webdriver.firefox.webdriver import WebDriver
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.firefox.options import Options


# https://pytest-selenium.readthedocs.io/en/latest/user_guide.html#configuration
@pytest.fixture
def firefox_options(firefox_options: Options):
    firefox_options.add_argument("--headless")
    return firefox_options

# https://pytest-selenium.readthedocs.io/en/latest/user_guide.html#nondestructive-tests
@pytest.mark.nondestructive
def test_get_root(driver: WebDriver):
    driver.get("http://0.0.0.0:8001")
    elem = WebDriverWait(driver, 10).until(
        EC.presence_of_element_located((By.ID, "time"))
    )
    assert bool(elem)
