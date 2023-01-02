public with sharing class Dog extends Animals{

    String breed{get; private set;}
    String color{get; private set;}

    public Dog(String Name, Integer weight, Integer age, string breed, string color) {
        super(name, weight, age);
        this.breed=breed;
        this.color=color;
    }
    public override void eat(){
        system.debug('the dog is eating');
    }
    public override void mov(){
        super.mov();
        system.debug('to play fetch');
    }
}