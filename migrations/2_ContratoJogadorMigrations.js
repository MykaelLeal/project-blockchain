const ContratoJogo = artifacts.require("ContratoJogo");

module.exports = function (deployer) {
  deployer.deploy(ContratoJogo);
};
