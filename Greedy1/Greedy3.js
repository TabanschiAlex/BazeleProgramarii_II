const weightLimit = 13;
let backPack = [];
let currentWeight = 0;

function addItem(price, weight) {
    let item = {};

    item.price = price;
    item.weight = weight;
    backPack.push(item);
}

function sortByPrice() {
    backPack.sort((a, b) => {
        if (a.price > b.price) {
            return 1;
        }
        else if (a.price < b.price) {
            return -1;
        }
        return 0;
    });
}

function addToBag() {
    for (let i = 0; i < backPack.length; i++) {
        currentWeight += backPack[i].weight;

        while (currentWeight > weightLimit) {
            currentWeight -= backPack[backPack.length - 1].weight;
            backPack.pop();
        }
    }
}

addItem(16, 8);
addItem(24, 6);
addItem(15, 3);
sortByPrice();
addToBag();
console.log("Для максимальной выгоды, нужно загрузить предметы с общим весом " + currentWeight + " кг.");
console.log(backPack);