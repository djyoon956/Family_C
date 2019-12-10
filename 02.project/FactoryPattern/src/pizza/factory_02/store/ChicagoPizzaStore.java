package pizza.factory_02.store;

import pizza.factory_02.pizza.Pizza;

import pizza.factory_02.pizza.chicago.ChicagoStyleCheesePizza;
import pizza.factory_02.pizza.chicago.ChicagoStyleClamPizza;
import pizza.factory_02.pizza.chicago.ChicagoStylePepperoniPizza;
import pizza.factory_02.pizza.chicago.ChicagoStyleVeggiePizza;

public class ChicagoPizzaStore extends PizzaStore {

	@Override
	Pizza createPizza(String type) {
		Pizza pizza = null;

		if (type.equals("cheese"))
			pizza = new ChicagoStyleCheesePizza();

		if (type.equals("pepper"))
			pizza = new ChicagoStylePepperoniPizza();

		if (type.equals("clam"))
			pizza = new ChicagoStyleClamPizza();

		if (type.equals("veggie"))
			pizza = new ChicagoStyleVeggiePizza();

		return pizza;
	}

}
