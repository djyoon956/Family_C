package pizza.factory_02.store;

import pizza.factory_02.pizza.Pizza;

import pizza.factory_02.pizza.newyork.NYStyleCheesePizza;
import pizza.factory_02.pizza.newyork.NYStyleClamPizza;
import pizza.factory_02.pizza.newyork.NYStylePepperoniPizza;
import pizza.factory_02.pizza.newyork.NYStyleVeggiePizza;

public class NYPizzaStore extends PizzaStore {

	@Override
	Pizza createPizza(String type) {
		Pizza pizza = null;

		if (type.equals("cheese"))
			pizza = new NYStyleCheesePizza();

		if (type.equals("pepper"))
			pizza = new NYStylePepperoniPizza();

		if (type.equals("clam"))
			pizza = new NYStyleClamPizza();

		if (type.equals("veggie"))
			pizza = new NYStyleVeggiePizza();

		return pizza;
	}

}
