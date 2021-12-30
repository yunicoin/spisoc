class spisoc(object):
    def __init__(self, m):
        self.spisoc=m
        self.index_first=0
        self.index_last=0
    def add_last(self, v):
        r=self.index_last
        self.spisoc[r][1]=len(self.spisoc)
        self.index_last=len(self.spisoc)
        self.spisoc.append([v, None])
    def add_first(self, v):
        if self.spisoc==[]:
            self.spisoc=[[v, None]]
        else:
            self.spisoc.append([v,self.spisoc[self.index_first][0]])
            self.index_first=len(self.spisoc)-1
    def add(self, v, i):
        ind1=None
        ind2=self.index_first
        if i==1:
            self.add_first(v)
        elif i==len(self.spisoc):
            self.add_last(v)
        else:
            while i>1:
                i-=1
                ind1=ind2
                ind2=self.spisoc[ind2][1]
            self.spisoc[ind1][1]=len(self.spisoc)
            self.spisoc.append([v, ind2])
    def del_first(self):
        r=self.index_first
        self.index_first=self.spisoc[self.index_first][1]
        self.spisoc=self.spisoc[0:r]+self.spisoc[r+1:len(self.spisoc)]
    def del_last(self):
        r=self.index_last
        i=0
        if len(self.spisoc)==1:
            self.spisoc=[]
        else:
            while self.spisoc[i][1]!=r and i<len(self.spisoc):
                i+=0
            self.spisoc[i][1]=None
            self.spisoc=self.spisoc[0:r]+self.spisoc[r+1:len(self.spisoc)]
    def print(self):
        print(self.spisoc)
    def del_index(self, i):
        ind1 = None
        ind2 = self.index_first
        if i == 1:
            self.del_first()
        elif i == len(self.spisoc):
            self.del_last()
        else:
            while i > 1:
                i -= 1
                ind1 = ind2
                ind2 = self.spisoc[ind2][1]
            self.spisoc[ind1][1] = self.spisoc[ind2][1]
            self.spisoc=self.spisoc[0:ind2]+self.spisoc[ind2+1:len(self.spisoc)]
    def del_val(self, v):
        ind1 = None
        ind2 = self.index_first
        i=0
        while self.spisoc[ind2][0] !=v and i<len(self.spisoc):
            i +=1
            ind1 = ind2
            ind2 = self.spisoc[ind2][1]
        self.spisoc[ind1][1] = self.spisoc[ind2][1]
        self.spisoc = self.spisoc[0:ind2] + self.spisoc[ind2 + 1:len(self.spisoc)]
    def find(self, v):
        i=self.index_first
        k=1
        while self.spisoc[i][0]!=v:
            i=self.spisoc[i][1]
            k+=1
        print(k)
    def clear(self):
        if self.spisoc==[]:
            print('пустой')
        else:
            print('не пуст')


if __name__=="__main__":
    a=[]
    a=spisoc(a)
    print('Команды в чат:')
    print('/add_firft #добавить в начало \n/add_last #добавить в конец\n/add #добавить по индоксу\n/del_first #удаление первого узла\n/del_last #удаление последнего узла\n/del_index #удаление по индексу\n/del_number #удаление по значению\n/find #поиск индекса по значению\n/print #ввывод\n/clear? #проверка на пустоту')
    while True:
        b=str(input())
        if b=='/add_first':
            print('введите значение')
            v=int(input())
            a.add_first(v)
        if b=='/add_last':
            print('введите значение')
            v=int(input())
            a.add_last(v)
        if b=='/add':
            print('введите индекс от '+str(1)+' до '+str(len(a.spisoc)+1))
            i=int(input())
            print('введите значение')
            a.add(int(input()), i)
        if b=='/del_first':
            a.del_first()
        if b=='/add_last':
            a.del_last()
        if b=='/del_index':
            print('введите индекс от '+str(1)+' до '+str(len(a.spisoc)+1))
            i=int(input())
            a.del_index(i)
        if b=='/del_number':
            print('введите значение')
            v=int(input())
            a.del_val(v)
        if b=='/find':
            print('введите значение')
            v=int(input())
            a.find(v)
        if b=='/print':
            a.print()
        if b=='/clear?':
            a.clear()
