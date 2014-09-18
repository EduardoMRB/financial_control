describe('Outgoing', function() {
  var outgoingMock, $httpBackend;

  beforeEach(module("FC.Services"));

  beforeEach(function () {
    inject(function ($injector) {
      $httpBackend = $injector.get("$httpBackend");
      outgoingMock = $injector.get("Outgoing");
    });
  });

  it('is defined', inject(function (Outgoing) { 
    expect(Outgoing).toBeDefined();
  }));
});
