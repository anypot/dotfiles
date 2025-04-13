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
        msg_box(f"{http_err}")
    except Exception as err:
        msg_box(f"{err}")
    return response_data


def msg_box(text):
    myBox = msgbox.MsgBox(XSCRIPTCONTEXT.getComponentContext())
    myBox.addButton("OK")
    myBox.renderFromBoxSize(400)
    myBox.numberOflines = 2
    myBox.show(text, 0, "ERROR!")


def get_coingecko_prices(col, line):
    desktop = XSCRIPTCONTEXT.getDesktop()
    model = desktop.getCurrentComponent()
    active_sheet = model.CurrentController.ActiveSheet
    base_url = "https://api.coingecko.com/api/v3"
    api_endpoint = "simple/price"
    ids_tuples = active_sheet.getCellRangeByName("A16:A24").getDataArray()
    ids = list(zip(*ids_tuples))[0]
    vs_currencies = "eur"
    url = (
        f'{base_url}/{api_endpoint}'
        f'?ids={",".join(ids)}'
        f'&vs_currencies={vs_currencies}'
    )

    response_data = call_api("GET", url, headers=None, payload=None)
    if response_data is not None:
        for id in ids:
            active_sheet[f"{col}{line}"].Value = response_data[id][vs_currencies]
            line += 1

    return


def get_kucoin_prices(col, line):
    desktop = XSCRIPTCONTEXT.getDesktop()
    model = desktop.getCurrentComponent()
    active_sheet = model.CurrentController.ActiveSheet
    base_url = "https://api.kucoin.com/api/v1"
    api_endpoint = "prices"
    currencies_tuples = active_sheet.getCellRangeByName("A2:A10").getDataArray()
    currencies = list(zip(*currencies_tuples))[0]
    base = "eur"
    url = (
        f'{base_url}/{api_endpoint}'
        f'?currencies={",".join(currencies)}'
        f'&base={base}'
    )

    response_data = call_api("GET", url, headers=None, payload=None)
    if response_data is not None:
        for c in currencies:
            active_sheet[f"{col}{line}"].Value = response_data["data"][c]
            line += 1

    return


def get_crypto_prices(*args):
    col = "E"
    line = 2
    get_coingecko_prices(col, line)
    # get_kucoin_prices(col, line)
    return


def show_amounts(*args):
    desktop = XSCRIPTCONTEXT.getDesktop()
    model = desktop.getCurrentComponent()
    active_sheet = model.CurrentController.ActiveSheet
    cells = {
        "B2": {
            "method": "GET",
            "url": active_sheet["B16"].String,
            "headers": None,
            "data": None,
            "path": "['result']['totalBalance'][0]['amount']",
            "decimal": pow(10, 8),
            "formula": "=B30+",
        },
        "B31": {
            "method": "GET",
            "url": active_sheet["C31"].String,
            "headers": None,
            "data": None,
            "path": "['result']['totalBalance'][0]['amount']",
            "decimal": pow(10, 8),
        },
        "B3": {
            "method": "GET",
            "url": active_sheet["B17"].String,
            "headers": None,
            "data": None,
            "path": "['data']['total']",
            "decimal": 1,
        },
        "B4": {
            "method": "GET",
            "url": active_sheet["B18"].String,
            "headers": None,
            "data": None,
            "path": "['chain_stats']['funded_txo_sum']",
            "decimal": pow(10, 8),
        },
        "B5": {
            "method": "GET",
            "url": active_sheet["B19"].String,
            "headers": None,
            "data": None,
            "path": "['result']",
            "decimal": pow(10, 18),
            "formula": "=B26+B27+B28+B29+",
        },
        "B26": {
            "method": "GET",
            "url": active_sheet["C26"].String,
            "headers": None,
            "data": None,
            "path": "['result']",
            "decimal": pow(10, 18),
        },
        "B27": {
            "method": "GET",
            "url": active_sheet["C27"].String,
            "headers": None,
            "data": None,
            "path": "['result']",
            "decimal": pow(10, 18),
        },
        "B28": {
            "method": "GET",
            "url": active_sheet["C28"].String,
            "headers": None,
            "data": None,
            "path": "['result']",
            "decimal": pow(10, 18),
        },
        "B29": {
            "method": "GET",
            "url": active_sheet["C29"].String,
            "headers": None,
            "data": None,
            "path": "['result']",
            "decimal": pow(10, 18),
        },
        "B6": {
            "method": "POST",
            "url": active_sheet["B20"].String,
            "headers": {
                "Content-Type": "application/json",
                "X-API-Key": active_sheet["L20"].String,
            },
            "data": {"key": active_sheet["O20"].String},
            "path": "['data']['account']['balance']",
            "decimal": 1,
        },
        "B7": {
            "method": "GET",
            "url": active_sheet["B21"].String,
            "headers": None,
            "data": None,
            "path": "['balance']['amount']",
            "decimal": pow(10, 6),
            "formula": "=B32+B33+",
        },
        # "B32": {
        #     "method": "GET",
        #     "url": active_sheet["C32"].String,
        #     "headers": None,
        #     "data": None,
        #     "path": "['delegation_responses'][0]['balance']['amount']",
        #     "decimal": pow(10, 6),
        # },
        # "B33": {
        #     "method": "GET",
        #     "url": active_sheet["C33"].String,
        #     "headers": None,
        #     "data": None,
        #     "path": "['delegation_responses'][1]['balance']['amount']",
        #     "decimal": pow(10, 6),
        # },
        # 'B8': {
        #     'method': 'GET',
        #     'url': active_sheet['B22'].String,
        #     'headers': None,
        #     'data': None,
        #     'path': "['result']",
        #     'decimal': pow(10, 18),
        # },
        # 'B9': {
        #     'method': 'GET',
        #     'url': active_sheet['B23'].String,
        #     'headers': None,
        #     'data': None,
        #     'path': "['result']",
        #     'decimal': pow(10, 18),
        # }
    }

    for c in cells:
        response_data = call_api(
            cells[c]["method"],
            cells[c]["url"],
            headers=cells[c]["headers"],
            payload=json.dumps(cells[c]["data"]),
        )
        if response_data is not None:
            amount = (
                float(eval(f'response_data{cells[c]["path"]}')) / cells[c]["decimal"]
            )
            if "formula" in cells[c]:
                active_sheet[c].Formula = f'{cells[c]["formula"]}{amount}'
            else:
                active_sheet[c].Value = amount

    return
