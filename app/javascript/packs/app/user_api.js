export function sign_in(email, password) {
  return fetch('/api/v1/sign_in', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({
      email: email,
      password: password
    })
  }).then((response) => {
    return response.json();
  }).then((body) => {
    return body.token;
  })
}