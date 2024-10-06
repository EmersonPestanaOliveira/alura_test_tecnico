class MockCategory {
  /// Resposta de sucesso ao buscar a lista de categorias
  Map<String, dynamic> getCategoriesSuccess() {
    return {
      "categorias": [
        {
          "id": 1,
          "nome": "roupas",
          "imagem": "https://picsum.photos/321/253?random=1"
        },
        {
          "id": 2,
          "nome": "decoração",
          "imagem": "https://picsum.photos/321/253?random=2"
        },
        {
          "id": 3,
          "nome": "canecas",
          "imagem": "https://picsum.photos/321/253?random=3"
        }
      ]
    };
  }

  /// Resposta de erro ao buscar a lista de categorias
  Map<String, dynamic> getCategoriesFail() {
    return {
      "Status": 400,
      "Message": "Ops Ocorreu um erro",
      "ObjList": null,
    };
  }
}
