from flask import Flask, jsonify
from bs4 import BeautifulSoup
import requests

app = Flask(__name__)


class Pesquisa:
    def __init__(self):
        self.titulo = ""
        self.link = ""


@app.route('/api/pesquisa/<string:dado_de_pesquisa>', methods=['GET'])
def api_pesquisa(dado_de_pesquisa):
    pesquisa_google = get_pesquisa(dado_de_pesquisa)
    return jsonify({"titulo": pesquisa_google.titulo, "link": pesquisa_google.link})


def get_pesquisa(dado_de_pesquisa):
    link_pesquisa = f"https://www.google.com/search?q={dado_de_pesquisa}"
    pesquisar = Pesquisa()

    response = requests.get(link_pesquisa).text
    soup = BeautifulSoup(response, 'html.parser')

    titulo = soup.find("div", class_="BNeawe vvjwJb AP7Wnd")
    if titulo:
        pesquisar.titulo = titulo.text.strip()

    link_url = soup.find("div", class_="BNeawe UPmit AP7Wnd lRVwie")
    if link_url:
        pesquisar.link = link_url.text.strip()

    return pesquisar


if __name__ == '__main__':
    app.run(debug=True)
