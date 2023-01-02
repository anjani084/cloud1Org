public with sharing class CoffeeMaker {
    private CoffeeBeans beans;
    private Water water;

    public CoffeeMaker(CoffeeBeans beans, Water water){
        this.beans=beans;
        this.water=water;
    }

    public coffee brewCoffee(){
        grindBeans();
        heatWater();
        return makeCoffee();
    }
    private void grindBeans(){
        system.debug('grinding the '+beans.name);
    }
    private void heatWater(){
        system.debug('heating the water');
    }
    private Coffee makeCoffee(){
        system.debug(' dropping the water on the '+beans.name);
        Coffee coffe=new Coffee('Fresh Coffee');
        return coffe;
    }

}