const contratoABI = [
    {
      "inputs": [
        {
          "internalType": "address",
          "name": "",
          "type": "address"
        }
      ],
      "name": "pacientes",
      "outputs": [
        {
          "internalType": "string",
          "name": "nome",
          "type": "string"
        },
        {
          "internalType": "uint256",
          "name": "idade",
          "type": "uint256"
        },
        {
          "internalType": "string",
          "name": "cpf",
          "type": "string"
        }
      ],
      "stateMutability": "view",
      "type": "function",
      "constant": true
    },
    {
      "inputs": [
        {
          "internalType": "string",
          "name": "_nome",
          "type": "string"
        },
        {
          "internalType": "uint256",
          "name": "_idade",
          "type": "uint256"
        },
        {
          "internalType": "string",
          "name": "_cpf",
          "type": "string"
        }
      ],
      "name": "cadastrarPaciente",
      "outputs": [],
      "stateMutability": "nonpayable",
      "type": "function"
    }
];
const contratoEndereco = '0x372aABD4e864A1392a30997Fe8abc5748CF8247a';


async function cadastrarPaciente(){
    const web3 = new Web3('HTTP://127.0.0.1:7545');
    const contrato = new web3.eth.Contract(contratoABI, contratoEndereco);
    const nome = document.getElementById('nome').value;
    const idade = document.getElementById('idade').value;
    const cpf = document.getElementById('cpf').value;
    const endereco = document.getElementById('endereco').value;

    try{
        const contas = await web3.eth.getAccounts();
        contrato.methods.cadastrarPaciente(nome, idade, cpf, endereco).send({from: contas[0]})
        .then(async (feedback) => {
            alert(`Cadastro bem-sucedida Hash: ${feedback.transactionHash}`);
        })
        .catch((err) => {
            console.error(err);
            alert('Ocorreu um erro ao cadastrar o paciente.');
        })
    }catch (erro) {
        console.error(erro);
        alert('Falha ao cadastrar paciente. Verifique os logs para mais detalhes.');
    }
}