const CASE_URL = "http://localhost:3000/api/v1/cases"
const sideBar = document.getElementById('side-bar')
const displayPanel = document.getElementById('display-panel')
const newForm = document.getElementById('new-form')

fetch(CASE_URL)
  .then(resp => resp.json())
  .then(json => populateCaseBar(json))

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

  const p = document.createElement('p')
  p.textContent = eachCase.body
  displayPanel.appendChild(p)
}

function clearDisplayPanel() {
  while (displayPanel.firstChild) {
    displayPanel.firstChild.remove()
  }
}

newForm.addEventListener('submit', handleSubmit)

function handleSubmit(ev) {
  ev.preventDefault()
  const title = newForm.elements['title']
  const body = newForm.elements['body']
  fetch(CASE_URL, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({
      title: title.value,
      body: body.value
    })
  }).then(resp => resp.json())
  .then(json => addNewCase(json, title, body))
}

function addNewCase(json, title, body) {
  title.value = ""
  body.value = ""
  displayCase(json)
  createATitle(json)
}

function handleDelete(eachCase, li) {
  fetch(CASE_URL + "/" + eachCase.id, {
    method: 'DELETE'
  })
  // .catch()
  li.remove()
  clearDisplayPanel()
}
