import uno
import msgbox
import json
import requests
from requests.exceptions import HTTPError


def call_api(method, url, headers, payload):
    response_data = None
    try:
        response = requests.request(method, url, headers=headers, data=payload)
        response.raise_for_status()
        response_data = json.loads(response.text)
    except HTTPError as http_err:
        msg_box(f'{http_err}')
    except Exception as err:
        msg_box(f'{err}')
    return response_data


def msg_box(text):
    myBox = msgbox.MsgBox(XSCRIPTCONTEXT.getComponentContext())
    myBox.addButton('OK')
    myBox.renderFromBoxSize(400)
    myBox.numberOflines = 2
    myBox.show(text, 0, 'ERROR!')


def get_stock_prices(*args):
    desktop = XSCRIPTCONTEXT.getDesktop()
    model = desktop.getCurrentComponent()
    active_sheet = model.CurrentController.ActiveSheet
    col = 'E'
    line = 5
    base_url = 'http://api.marketstack.com/v1'
    api_endpoint = 'eod/latest'
    api_key = active_sheet['A15'].String
    symbols_tuples = active_sheet.getCellRangeByName('B5:B8').getDataArray()
    symbols = list(zip(*symbols_tuples))[0]
    exchange = 'XPAR'
    url = (f'{base_url}/{api_endpoint}'
           f'?access_key={api_key}'
           f'&symbols={",".join(s + f".{exchange}" for s in symbols)}'
           f'&exchange={exchange}'
    )

    response_data = call_api('GET', url, headers=None, payload=None)
    if response_data is not None:
        for data in response_data['data']:
            active_sheet[f'{col}{line}'].Value = data['close']
            line += 1

    return
