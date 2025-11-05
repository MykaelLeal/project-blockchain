// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.19;


contract ContratoEstudante {

    struct Estudante{
        string nome;
        uint idade;
        bool preRequisito;
    }

    mapping (address => Estudante) public estudantes;

    function _ehIdadeValidade(uint _idade) private pure returns(bool){
        return _idade >= 18;
    }

    function _ehNomeValido(string memory _nome) private pure returns(bool){
        return bytes(_nome).length != 0;
    }

    function _ehEstudanteValido(Estudante memory _estudante) private pure returns(bool){
        return _ehIdadeValidade(_estudante.idade) && _ehNomeValido(_estudante.nome) && _estudante.preRequisito;
    }

    function matricularEstudante(string memory _nome, uint _idade, bool _preRequisito ) public {
        Estudante memory estudante;
        estudante.idade = _idade;
        estudante.nome = _nome;
        estudante.preRequisito = _preRequisito;
        if(_ehEstudanteValido(estudante)){
            estudantes[msg.sender] = estudante;
        } else{
            revert("Os dados nao sao validos!");
        }    
    }
}

