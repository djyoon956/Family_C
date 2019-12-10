package pizza.factory_01.store;

import pizza.factory_01.factory.SimplePizzaFactory;
import pizza.factory_01.pizza.Pizza;

public abstract class PizzaStore {

	SimplePizzaFactory simplePizzaFactory;

	public PizzaStore(SimplePizzaFactory simplePizzaFactory) {
		this.simplePizzaFactory = simplePizzaFactory;
	}

	public Pizza orderPizza(String type) {

		Pizza pizza = null;
		
		pizza = simplePizzaFactory.createPizza(type);

		pizza.prepare();
		pizza.bake();
		pizza.cut();
		pizza.box();

		return pizza;
	}
}
