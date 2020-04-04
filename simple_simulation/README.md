# Simulation

This is a mix of ECS principles and 'typical' OOP.

There aren't any 'components' that get searched for by components. In a sense, everything is static, which happens to make things fast. This normally comes at the cost of flexability and modularity. This project attempts to mitigate related issues through heavy abstraction - breaking classes down into the 'components' that they would normally be constructed from in an ECS project. 
