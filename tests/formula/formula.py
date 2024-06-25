from abc import ABC, abstractmethod
from typing import Any


class ActBehaviour(ABC):

    def __init__(self) -> None:
        
        self.actions = {
            "_": None,
            "+": self.summ,
            "-": self.subtr,
            "/": self.divis,
            "*": self.mult,
            "^": self.concat
    }

    def summ(self):
        pass

    def subtr(self):
        pass

    def divis(self):
        pass

    def mult(self):
        pass

    def concat(self):
        pass


class Formula(ActBehaviour):

    def __init__(self, components: list) -> None:
        self.components = components

    
    def calculate(self, data: list) -> float:
        
        for c in self.components:
            pass



class ABCComponent(ActBehaviour):
    
    def __init__(self, action: str, value: Any) -> None:
        super().__init__()

        if action in self.actions:
            self.action = action
        else: raise ValueError("No such action!")

class FloatComponent(ABCComponent):

    def __init__(self, action: str, value: Any) -> None:
        super().__init__(action, value)


        value_ = float(value)

if __name__ == "__main__":

    c1 = FloatComponent("_", 100)
    c2 = FloatComponent("-", 40)

    formula = Formula([c1, c2]) # Здесь должна быть формула! Без значенй, просто схема расчета




    