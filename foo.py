

class Foobar():
    def __init__(self):
        print("xyz")

    def _priv(self, x):
        return x * 2

    def pub(self):
        return self._priv(2)


x = Foobar()
print(x.pub())
