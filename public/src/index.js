const CASE_URL = "http://localhost:3000/api/v1/cases"
const CAT_URL = "http://localhost:3000/api/v1/categories"
const sideBar = document.getElementById('side-bar')
const displayPanel = document.getElementById('display-panel')
const newForm = document.getElementById('new-form')
const searchForm = document.getElementById('search-form')
const filterSelect = document.getElementById('filter')
const submitButton = document.getElementById('btn-submit')


fetch(CASE_URL)
  .then(resp => resp.json())
  .then(json => populateCaseBar(json))

fetch(CAT_URL)
  .then(resp => resp.json())
  .then(json => populateSelects(json))

filterSelect.addEventListener('change', handleFilter)
searchForm.addEventListener('submit', handleSearch)

//search
function handleSearch(ev) {
  ev.preventDefault()
  const keyword = ev.target.search.value
  clearDisplayPanel()
  clearSideBar()
  fetch(CASE_URL)
    .then(resp => resp.json())
    .then (json => {
      json.forEach( (kase) => {
        if (kase.body.includes(keyword)) {
          createATitle(kase)
        }
      })
    })
  const backButton = document.createElement('button')
  backButton.classList.add('btn-info')
  backButton.textContent = "Back"
  backButton.id = "back"
  const div = document.getElementById('keyword-search')
  div.insertBefore(backButton, searchForm)
  backButton.addEventListener('click', (ev) => goBack(ev, backButton))
}

function goBack(ev, backButton) {
  searchForm.search.value = ""
  backButton.remove()
  clearSideBar()
  clearDisplayPanel()
  fetch(CASE_URL)
    .then(resp => resp.json())
    .then(json => populateCaseBar(json))
}

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
  li.classList.add("cursor-thing")
  li.addEventListener('click', () => displayCase(eachCase, li))
  sideBar.appendChild(li)

  const h4 = document.createElement('h4')
  h4.textContent = eachCase.title
  li.appendChild(h4)
}

// Display Panel
function displayCase(eachCase, li) {
  clearDisplayPanel()

  fetch(CASE_URL + "/" + eachCase.id)
  .then(resp => resp.json())
  .then(json => {
    const h2 = document.createElement('h2')
    h2.textContent = eachCase.title
    displayPanel.appendChild(h2)

    const editButton = document.createElement('button')
    editButton.textContent = "Edit"
    editButton.classList.add('btn-warning')
    editButton.id = 'edit-button-one'
    editButton.addEventListener('click', () => startEdit(eachCase))
    displayPanel.appendChild(editButton)

    const deleteButton = document.createElement('button')
    deleteButton.textContent = "Delete"
    deleteButton.classList.add('btn-danger')
    displayPanel.appendChild(deleteButton)
    deleteButton.addEventListener('click', () => handleDelete(eachCase, li))

    const catUl = document.createElement('ul')
    catUl.textContent = "Tags:"
    displayPanel.appendChild(catUl)

    json.categories.forEach( (cat) => {
      const catLi = document.createElement('li')
      catLi.textContent = cat.tag
      catUl.appendChild(catLi)
    })

    const p = document.createElement('p')
    p.textContent = json.body
    p.id = "case-body"
    displayPanel.appendChild(p)
  })
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
  const catIds = []
  const categories = document.getElementsByClassName('categories')
  for (const cat of categories) {
    if (cat.checked === true) {
      catIds.push(cat.id)
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
      ids: catIds
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

// edit
function startEdit(eachCase) {
  const editButton = document.getElementById('edit-button-one')
  editButton.hidden = "hidden"

  const form = document.createElement('form')
  form.id = 'edit-form'

  const p = document.getElementById('case-body')
  displayPanel.insertBefore(form, p)

  const textarea = document.createElement('textarea')
  textarea.value = p.textContent
  textarea.name = "body"
  textarea.rows = "8"
  textarea.cols = "80"
  form.appendChild(textarea)

  const inputButton = document.createElement('input')
  inputButton.type = "submit"
  inputButton.value = "Submit"
  form.addEventListener('submit', (ev) => handleEdit(ev, eachCase))
  form.appendChild(inputButton)

  p.remove()
}

function handleEdit(ev, eachCase) {
  ev.preventDefault()

  const editButton = document.getElementById('edit-button-one')
  editButton.hidden =  ""

  fetch(CASE_URL + "/" + eachCase.id, {
    method: 'PATCH',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({
      body: ev.target.body.value
    })
  })
  .then(resp => resp.json())
  .then(json => renderEdit(json, ev))
}

function renderEdit(json, ev) {
  const p = document.createElement('p')
  p.id = "case-body"
  p.textContent = json.body
  displayPanel.insertBefore(p, ev.target)
  ev.target.remove()
}

// delete
function handleDelete(eachCase, li) {
  fetch(CASE_URL + "/" + eachCase.id, {
    method: 'DELETE'
  })
  // .catch()?
  li.remove()
  clearDisplayPanel()
}
