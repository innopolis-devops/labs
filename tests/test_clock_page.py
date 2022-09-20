'''
Module for testing `clock.html` file from `templates`
folder. Here we test the status code (it should be 
`200`) and the text from the page (it should contain
`TIME TO SMILE`).
'''


def test_clock_page(client):
    response = client.get("/")
    assert response.status_code == 200
    response_decoded = response.data.decode()
    assert 'TIME TO SMILE' in response_decoded
