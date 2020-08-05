@isTest
public class BankTest extends bank {
    @isTest static void TestDeposit(){
        Savings SavAcct=new savings('Zach');
        savAcct.deposit(50.00); 
      	Checking checkAcct=new checking('zach');
        checkAcct.deposit(50.2343);
        System.assertEquals(checkAcct.balance, 50.23);
        system.assertEquals(savAcct.balance, 50.00);     
    }
    @isTest static void TestWithdraw(){
        Savings SavAcct=new savings('Zach');
        savAcct.deposit(50.00); 
        savAcct.withdraw(50.00);
        Checking CheckAcct=new checking('zach');
        checkAcct.deposit(50.002);
        checkAcct.withdraw(25.002);
        system.assertEquals(25.00, checkAcct.balance);
        system.assertEquals(50.00, savAcct.balance);
    }
    @isTest static void TestDetails(){
        Savings SavAcct=new savings('Zach');
        system.assertEquals(SavAcct.AccountHolder, 'Zach');
        system.assertequals(savAcct.Balance,0.00);
        system.assertEquals(savAcct.accountType, 'Savings');
    }

}
/*
public class Savings extends bank {
	
    public Savings(string name){
        string accnum='';
        for(integer i=0;i<9;i++){
           string x= string.valueof(integer.valueof(math.ceil(Math.random() * 10)));
            accnum+=x;
        }
        this.accountNumber=accnum;
        this.accountHolder=name;
        this.balance=0.00;
        this.accountType='Savings';
    }

}
public abstract class Bank {
    protected string accountHolder{get;set;}
    protected decimal balance{get;set;}
    protected string accountNumber{get;set;}
    protected string accountType{get;set;}
     public void deposit(decimal amount){
            amount=amount.setScale(2);
            this.balance+=amount;
            system.debug('You deposited $'+amount+' from acount #'+this.accountNumber+', your new balance is $'+this.balance);
    	
    }
    public void withdraw(decimal amount){
        if(this.accountType!='Savings'){
            amount=amount.setScale(2);
            if(this.balance-amount>=0){
                this.balance-=amount;
                system.debug('You withdrew $'+amount+' from acount #'+this.accountNumber+', your new balance is $'+this.balance);
            }
            else{
                system.debug('Insufficient funds');
            }
        }
        else{
            system.debug('You Can not Withdraw From Savings');
        }
        
    }
    public void details(){
     system.debug(this.accountholder+', your balance for '+this.accountType+' account#'+this.accountNumber+' is $'+this.balance);   
    }
  
}
*/