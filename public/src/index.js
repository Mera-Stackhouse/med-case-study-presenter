const CASE_URL = "http://localhost:3000/api/v1/cases"
const CAT_URL = "http://localhost:3000/api/v1/categories"
const sideBar = document.getElementById('side-bar')
const displayPanel = document.getElementById('display-panel')
const newForm = document.getElementById('new-form')
const filterSelect = document.getElementById('filter')
const submitButton = document.getElementById('btn-submit')


fetch(CASE_URL)
  .then(resp => resp.json())
  .then(json => populateCaseBar(json))

fetch(CAT_URL)
  .then(resp => resp.json())
  .then(json => populateSelects(json))

filterSelect.addEventListener('change', handleFilter)

//filter side Bar
function handleFilter(ev) {
  clearDisplayPanel()
  clearSideBar()
  if (ev.target.value === "0") {
    fetch(CASE_URL)
      .then(resp => resp.json())
      .then(json => populateCaseBar(json))
  } else {
    fetch(CAT_URL + "/" + ev.target.value)
      .then(resp => resp.json())
      .then(json => populateCaseBar(json.cases))
  }
}

function resetFilter() {
  clearSideBar()
  clearDisplayPanel()
  filterSelect.value = "0"
  fetch(CASE_URL)
    .then(resp => resp.json())
    .then(json => populateCaseBar(json))
}

// populate select filter and new form check boxes
function populateSelects(json) {
  json.forEach( (cat) => {
    const option = document.createElement('option')
    option.value = cat.id
    option.textContent = cat.tag
    filterSelect.appendChild(option)

    const div = document.createElement('div')

    const catInput = document.createElement('input')
    catInput.type = "checkbox"
    catInput.id = cat.id
    catInput.classList.add("categories")
    catInput.name = cat.tag
    div.appendChild(catInput)

    const label = document.createElement('label')
    label.textContent = cat.tag
    label.setAttribute('for', cat.tag)
    div.appendChild(label)
    newForm.insertBefore(div, submitButton)
  })
}

//Side Bar
function populateCaseBar(json) {
  json.forEach( (eachCase) => {
    createATitle(eachCase)
  })
}

function createATitle(eachCase) {
  const li = document.createElement('li')
  li.addEventListener('click', () => displayCase(eachCase, li))
  sideBar.appendChild(li)

  const h4 = document.createElement('h4')
  h4.textContent = eachCase.title
  li.appendChild(h4)
}

// Display Panel
function displayCase(eachCase, li) {
  clearDisplayPanel()

  const h2 = document.createElement('h2')
  h2.textContent = eachCase.title
  displayPanel.appendChild(h2)

  const editButton = document.createElement('button')
  editButton.textContent = "Edit"
  editButton.classList.add('btn-warning')
  displayPanel.appendChild(editButton)

  const deleteButton = document.createElement('button')
  deleteButton.textContent = "Delete"
  deleteButton.classList.add('btn-danger')
  displayPanel.appendChild(deleteButton)
  deleteButton.addEventListener('click', () => handleDelete(eachCase, li))

  const catUl = document.createElement('ul')
  catUl.textContent = "Tags:"
  displayPanel.appendChild(catUl)

  eachCase.categories.forEach( (cat) => {
    const catLi = document.createElement('li')
    catLi.textContent = cat.tag
    catUl.appendChild(catLi)
  })

  const p = document.createElement('p')
  p.textContent = eachCase.body
  displayPanel.appendChild(p)
}

// Clearing functions
function clearDisplayPanel() {
  while (displayPanel.firstChild) {
    displayPanel.firstChild.remove()
  }
}

function clearSideBar() {
  while (sideBar.firstChild) {
    sideBar.firstChild.remove()
  }
}

// New Case
newForm.addEventListener('submit', handleSubmit)

function handleSubmit(ev) {
  ev.preventDefault()
  const title = newForm.title
  const body = newForm.body
  const newArray = []
  const categories = document.getElementsByClassName('categories')
  for (const cat of categories) {
    if (cat.checked === true) {
      newArray.push(cat.id)
      cat.checked = false
    }
  }
  fetch(CASE_URL, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({
      title: title.value,
      body: body.value,
      ids: newArray
    })
  }).then(resp => resp.json())
  .then(json => addNewCase(json, title, body))
  //where does the catch go?
}

function addNewCase(json, title, body) {
  title.value = ""
  body.value = ""
  if (filterSelect.value !== "0"){
    resetFilter()
    displayCase(json)
  } else {
    displayCase(json)
    createATitle(json)
  }
}

// delete
function handleDelete(eachCase, li) {
  fetch(CASE_URL + "/" + eachCase.id, {
    method: 'DELETE'
  })
  // .catch()
  li.remove()
  clearDisplayPanel()
}
