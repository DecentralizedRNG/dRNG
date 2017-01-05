contract('dRNGToken', function(accounts) {

  it("should assert true", function(done) {
    var IdRNGToken = dRNGToken.deployed();
    assert.isTrue(true);
    done();
  });

  it("should put 1000000 dRT in account:" + accounts[0], function() {
    var IdRNGToken = dRNGToken.deployed();
    return IdRNGToken.balanceOf.call(accounts[0]).then(function(Balance) {
      assert.equal(Balance.valueOf(), 1000000, "1000000 wasn't in account:" + accounts[0]);
    });
  });

});
