const ContratoEstudante = artifacts.require("ContratoEstudante");

module.exports = function (deployer) {
  deployer.deploy(ContratoEstudante, "ContratoEstudante");
};
