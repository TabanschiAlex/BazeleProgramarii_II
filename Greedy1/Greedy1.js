let clients = [];
let quantity = random(1, 30);

function random(minRange, maxRange) {
    return Math.floor(Math.random() * (maxRange - minRange + 1) + minRange)
}

function createList(clients) {
    for (let i = 0; i < quantity; i++) {
        clients[i] = random(5, 45);
    }
    return clients;
}

function sortMax(clients) {
    let sum = 0;

    clients.sort((a, b) => {
        if (a > b) {
            return - 1;
        }
        else if (a < b) {
            return 1;
        }
            return 0;
    });
    for (let i = 0; i < quantity - 1; i++) {
        sum += clients[i];
    }
    return sum;
}

function sortMin(clients) {
    let sum = 0;

    clients.sort((a, b) => {
        if (a > b) {
            return 1;
        }
        else if (a < b) {
            return -1;
        }
            return 0;
    });
    for (let i = 0; i < quantity - 1; i++) {
        sum += clients[i];
    }
    return sum;
}

console.log(createList(clients));
console.log("Общее время ожидания при сортировке с макс. временем = " + sortMax(clients) + " мин.");
console.log("Общее время ожидания при сортировке с мин. временем = " + sortMin(clients) + " мин.");