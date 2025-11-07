// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.19;


contract ContratoEstudante {

    struct Estudante{
        string nome;
        uint idade;
        string CPF;
        bool preRequisito;
    }

    mapping (address => Estudante) public estudantes;

    function _ehIdadeValidade(uint _idade) private pure returns(bool){
        return _idade >= 12;
    }

    function _validaCPF ( string memory _CPF) private pure returns (bool) {
         return bytes(_CPF).length == 12;

    }

    function _ehNomeValido(string memory _nome) private pure returns(bool){
        return bytes(_nome).length != 0;
    }

    function _ehEstudanteValido(Estudante memory _estudante) private pure returns(bool){
        return _ehIdadeValidade(_estudante.idade) && _ehNomeValido(_estudante.nome) && _validaCPF(_estudante.CPF) && _estudante.preRequisito;
    }

    function matricularEstudante(string memory _nome, uint _idade, string memory _CPF, bool _preRequisito ) public {
        Estudante memory estudante;
        estudante.idade = _idade;
        estudante.nome = _nome;
        estudante.CPF = _CPF;
        estudante.preRequisito = _preRequisito;
        if(_ehEstudanteValido(estudante)){
            estudantes[msg.sender] = estudante;
        } else{
            revert("Os dados nao sao validos!");
        }    
    }
}

