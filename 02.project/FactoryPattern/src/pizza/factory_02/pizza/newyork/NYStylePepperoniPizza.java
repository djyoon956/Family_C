package pizza.factory_02.pizza.newyork;

import pizza.factory_02.pizza.Pizza;


public class NYStylePepperoniPizza extends Pizza {
	public NYStylePepperoniPizza() {
		this.name = "뉴욕 Pepperoni 피자";
		this.dough = "씬";
		this.sauce = "뉴욕 산 토마토 소스";
		this.toppings.add("뉴욕 산 Pepperoni");
	}
}
