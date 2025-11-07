// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.19;

contract ContratoPaciente {

    struct Paciente {
        string nome;
        uint idade;
        string cpf;

    }

    mapping(address => Paciente) public pacientes;


    function _ehIdadeValida(uint _idade) private pure returns (bool) {
        return _idade >= 12;
    }

    function _ehNomeValido(string memory _nome) private pure returns (bool) {
        return bytes(_nome).length != 0;
    }

    function _validaCPF ( string memory _cpf) private pure returns (bool) {
         return bytes(_cpf).length == 12;

    }

    function _ehPacienteValido(Paciente memory _paciente) private pure returns (bool) {
        return _ehIdadeValida(_paciente.idade) && _ehNomeValido(_paciente.nome) && _validaCPF(_paciente.cpf);
    }

    function cadastrarPaciente(string memory _nome, uint _idade, string memory _cpf) public {
        Paciente memory paciente;
        paciente.nome = _nome;
        paciente.idade = _idade;
        paciente.cpf = _cpf;

        if (_ehPacienteValido(paciente)) {
            pacientes[msg.sender] = paciente;
        } else {
            revert("Os dados fornecidos nao sao validos para cadastro!");
        }
    }

}
