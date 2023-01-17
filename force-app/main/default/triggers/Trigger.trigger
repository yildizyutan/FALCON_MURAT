trigger Trigger on SOBJECT (before insert) {
       
    //Write a SOQL that gets both the Account Id and Contact First and Last name using the Account Name.

    List<Account> listAcc = [SELECT Id, (SELECT FirstName, LastName FROM Contact ) FROM Account WHERE Name = 'Test'];

   /*
○      Write a Rollup Trigger for the Custom Objects
○      Custom Object A
■      Id
■      Total Cost
○      Custom Object B
■      Id
■      Qty
■      Unit Price
■      Parent Lookup (Custom Object A)
○      Custom Object A has a Total that is calculated based on the Qty x Unit Price of ALL Custom Object B’s related to it.
○      When the Qty or Unit Price is updated on Custom Object B, then recalculate the Total on Custom Object A.

   */





List<A> listATot = New List<A>;

  for (B bEach : trigger.new) {
    Integer Total;  
    
    Total == bEach.qty * bEach.UnitPrice;
    
    for (A aEach : bEach.A) {
        aEach.total = Total;
        aEach.Id = bEach.Id;
    }
  }
  listTot.add(aEach);

  insert listTot;

}