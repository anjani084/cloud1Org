import { LightningElement } from "lwc";
import getRandomRecipe from "@salesforce/apex/Spoonacular.getRandomReceipe";
import getRecipeByIngredients from "@salesforce/apex/Spoonacular.getReceipeByIngredient";

export default class RecipeSearch extends LightningElement {
  recipes = [];
  fetchRandomRecipe() {
    getRandomRecipe()
      .then((data) => {
        this.recipes =JSON.parse(data) && JSON.parse(data).recipes?JSON.parse(data).recipes:[];
        console.log('this.reciepes: '+this.recipes);
      })
      
      .catch((error) => {
        console.error(error);
      });
  }

  fetchRecipesByIngredients() {
    console.log('inside handler');
    const ingredients = this.template.querySelector(".ingredient-input").value;
    console.log('ingredients'+ingredients);
    getRecipeByIngredients({ ingredients })
      .then((data) => {
        this.recipes = JSON.parse(data);
      })
      .catch((error) => {
        console.error(error);
      });
  }
}