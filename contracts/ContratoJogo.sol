// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.19;

contract ContratoJogo {

    struct Jogador {
        string nome;
        uint idade;
        bool aceitouTermos;
    }

    mapping(address => Jogador) public jogadores;

    // Verifica se a idade é válida (mínimo de 13 anos)
    function _ehIdadeValida(uint _idade) private pure returns (bool) {
        return _idade >= 13;
    }

    // Verifica se o nome não é vazio
    function _ehNomeValido(string memory _nome) private pure returns (bool) {
        return bytes(_nome).length != 0;
    }

    // Verifica se o jogador cumpre os requisitos para cadastro
    function _ehJogadorValido(Jogador memory _jogador) private pure returns (bool) {
        return _ehIdadeValida(_jogador.idade) && _ehNomeValido(_jogador.nome) && _jogador.aceitouTermos;
    }

    // Função pública para cadastrar um jogador
    function cadastrarJogador(string memory _nome, uint _idade, bool _aceitouTermos) public {
        Jogador memory jogador;
        jogador.nome = _nome;
        jogador.idade = _idade;
        jogador.aceitouTermos = _aceitouTermos;

        if (_ehJogadorValido(jogador)) {
            jogadores[msg.sender] = jogador;
        } else {
            revert("Os dados fornecidos nao sao validos para cadastro!");
        }
    }

    // Retorna os dados de um jogador pelo endereço
    function obterJogador(address _endereco) public view returns (string memory, uint, bool) {
        Jogador memory j = jogadores[_endereco];
        return (j.nome, j.idade, j.aceitouTermos);
    }
}
