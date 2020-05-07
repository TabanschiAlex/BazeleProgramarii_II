let listOfSpectacles = [];

function addSpectacle(begins, ends) {
    let spectacle = {};

    spectacle.startTime = begins;
    spectacle.endTime = ends;
    spectacle.duration = ends - begins;
    listOfSpectacles.push(spectacle);
}

function sortByStart() {
    listOfSpectacles.sort((a, b) => {
        if (a.startTime > b.startTime) {
            return 1;
        }
        else if (a.startTime < b.startTime) {
            return -1;
        }
        return 0;
    });
}

function findOptimalInterval() {
    for (let i = 0; i < listOfSpectacles.length - 1; i++) {
        if (listOfSpectacles[i].startTime === listOfSpectacles[i + 1].startTime) {
            if (listOfSpectacles[i].duration < listOfSpectacles[i + 1].duration) {
                listOfSpectacles.splice(i + 1, 1);
            }
            else {
                listOfSpectacles.splice(i, 1);
            }
        }
        if (listOfSpectacles[i].endTime > listOfSpectacles[i + 1].endTime) {
            listOfSpectacles.splice(i, 1);
        }
    }
}

addSpectacle(10, 15);
addSpectacle(2, 4);
addSpectacle(7, 9);
addSpectacle(21, 23);
addSpectacle(10, 12);
addSpectacle(12, 15);
addSpectacle(7, 8);
addSpectacle(20, 24);

sortByStart();
findOptimalInterval();

console.log("Наибольшее количетсво спектаклей которые можно поставить в одном зале: ")
console.log(listOfSpectacles);