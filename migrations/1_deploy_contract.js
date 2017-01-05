module.exports = function(deployer) {
  deployer.deploy(Owned);
  deployer.autolink();
  deployer.deploy(dRNG);
  deployer.autolink();
  deployer.deploy(dRNGToken);
  deployer.autolink();
  deployer.deploy(dRNGParent);  
};
