contract('Owned', function (accounts) {
  it("should assert true", function (done) {
    var IOwned = Owned.deployed();
    assert.isTrue(true);
    done();
  });

  it("owner must be:" + accounts[0], function(){
    var IOwned = Owned.deployed();
    return IOwned.Owner.call(accounts[0]).then(function(Owner){
      assert.equal(Owner.valueOf(), accounts[0], "Owner wasn't:" + accounts[0]);
    });
  });

});
