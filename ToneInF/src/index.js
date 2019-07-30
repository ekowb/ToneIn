// Variables
const bodyTag = document.querySelector('body');
const divTag = document.createElement('div');
const ulTag = document.createElement('ul');
const liTag = document.createElement('li');
divTag.className = "grid-container"
console.log(divTag)
const selectTag = document.createElement('select')
// Arrays
const genres = ["Choose a Genre", "Alternative", "Blues", "Christian", "Country", "Dance", "Electronic", "Hip-Hop/Rap", "Jazz", "Latin", "Pop", "R&B/Soul", "Rock"]
const colorPicker = document.createElement('input')
colorPicker.type = 'color'
console.log(colorPicker)

// Page Setup
bodyTag.appendChild(selectTag)
bodyTag.appendChild('br')
bodyTag.appendChild(colorPicker)
bodyTag.appendChild(divTag)

genres.forEach(function(e){
    selectTag.innerHTML += `<option value=${e}>${e}</option>`
})



// JSON Fetch
selectTag.addEventListener('change', function(f){
    f.preventDefault()
    let divOn = document.querySelector("div")
    divOn.innerHTML = ""
    console.log(f.target.value)

    fetch("http://localhost:3000/albums")
    .then(resp => resp.json())
    .then(data => {
    data.forEach(function(e){
        if (e.genre === f.target.value) {
            var gridTag = document.createElement('div');
            gridTag.className = "grid-item"
            gridTag.innerHTML = `<img src= ${e.image_url}>`
            gridTag.style.backgroundColor = e.color

            gridTag.addEventListener('click', function(g){
                g.target.appendChild(liTag);
                liTag.innerText = `${e.title} - ${e.artist}`
                console.log(g.target)
            })
            // function isBigEnough(value) {
            //     return value >= 10;
            //   }

            // if (rgbArray.filter )
            
        
            str1 = `${gridTag.style.backgroundColor}`.slice(4)
            str2 = str1.substring(0, str1.length - 1);
            var rgbArray = str2.split(", ")


            difference = sqrt((rgbArray[0] - red2)^2 + (rgbArray[1] - green2)^2 + (rgbArray[2] - blue2)^2)

            
            divOn.appendChild(gridTag)
            
            
        //     var smlCount = 0
        //     rgbArray.forEach(function(f) {
        //         if (parseInt(f) < 40) {
        //             smlCount += 1
        //         }
        //     })
        //     if (smlCount === 3) {
        //         console.log(rgbArray)
        //     }
        //     else {
        //         divOn.appendChild(gridTag)
        //     }
    }
    })
})

    
})



