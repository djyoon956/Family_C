package pizza.factory_01.factory;

import pizza.factory_01.pizza.CheesePizza;
import pizza.factory_01.pizza.ClamPizza;
import pizza.factory_01.pizza.PepperoniPizza;
import pizza.factory_01.pizza.Pizza;
import pizza.factory_01.pizza.VeggiePizza;

public class SimplePizzaFactory {

	public Pizza createPizza(String type) {

		Pizza pizza = null;

		if (type.equals("cheese"))
			pizza = new CheesePizza();

		if (type.equals("pepper"))
			pizza = new PepperoniPizza();

		if (type.equals("clam"))
			pizza = new ClamPizza();

		if (type.equals("veggie"))
			pizza = new VeggiePizza();

		return pizza;
	}
}
