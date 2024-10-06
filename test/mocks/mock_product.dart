class MockProduct {
  /// Resposta de sucesso ao buscar a lista de produtos
  Map<String, dynamic> getProductsSuccess() {
    return {
      "produtos": [
        {
          "id": 1,
          "categoriaId": 1,
          "nome": "Camiseta Básica",
          "preço": 29.99,
          "imagem": "https://picsum.photos/312/292?random=4"
        },
        {
          "id": 2,
          "categoriaId": 1,
          "nome": "Calça Jeans",
          "preço": 79.99,
          "imagem": "https://picsum.photos/312/292?random=5"
        },
        {
          "id": 3,
          "categoriaId": 1,
          "nome": "Jaqueta de Couro",
          "preço": 199.99,
          "imagem": "https://picsum.photos/312/292?random=6"
        },
        {
          "id": 4,
          "categoriaId": 1,
          "nome": "Tênis Esportivo",
          "preço": 129.99,
          "imagem": "https://picsum.photos/312/292?random=7"
        },
        {
          "id": 5,
          "categoriaId": 1,
          "nome": "Vestido Floral",
          "preço": 59.99,
          "imagem": "https://picsum.photos/312/292?random=8"
        },
        {
          "id": 6,
          "categoriaId": 2,
          "nome": "Vaso Decorativo",
          "preço": 49.99,
          "imagem": "https://picsum.photos/312/292?random=9"
        },
        {
          "id": 7,
          "categoriaId": 2,
          "nome": "Quadro Moderno",
          "preço": 99.99,
          "imagem": "https://picsum.photos/312/292?random=10"
        },
        {
          "id": 8,
          "categoriaId": 2,
          "nome": "Luminária de Mesa",
          "preço": 39.99,
          "imagem": "https://picsum.photos/312/292?random=11"
        },
        {
          "id": 9,
          "categoriaId": 2,
          "nome": "Almofada Colorida",
          "preço": 19.99,
          "imagem": "https://picsum.photos/312/292?random=12"
        },
        {
          "id": 10,
          "categoriaId": 2,
          "nome": "Relógio de Parede",
          "preço": 69.99,
          "imagem": "https://picsum.photos/312/292?random=13"
        },
        {
          "id": 11,
          "categoriaId": 3,
          "nome": "Caneca de Porcelana",
          "preço": 19.99,
          "imagem": "https://picsum.photos/312/292?random=14"
        },
        {
          "id": 12,
          "categoriaId": 3,
          "nome": "Caneca Térmica",
          "preço": 34.99,
          "imagem": "https://picsum.photos/312/292?random=15"
        },
        {
          "id": 13,
          "categoriaId": 3,
          "nome": "Caneca com Estampa",
          "preço": 24.99,
          "imagem": "https://picsum.photos/312/292?random=16"
        },
        {
          "id": 14,
          "categoriaId": 3,
          "nome": "Caneca Personalizada",
          "preço": 29.99,
          "imagem": "https://picsum.photos/312/292?random=17"
        },
        {
          "id": 15,
          "categoriaId": 3,
          "nome": "Caneca Mágica",
          "preço": 39.99,
          "imagem": "https://picsum.photos/312/292?random=18"
        },
      ]
    };
  }

  /// Resposta de erro ao buscar a lista de produtos
  Map<String, dynamic> getProductsFail() {
    return {
      "Status": 400,
      "Message": "Ops Ocorreu um erro",
      "ObjList": null,
    };
  }
}
