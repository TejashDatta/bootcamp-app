document.addEventListener("turbolinks:load", () => {
  let clearFormButton = document.querySelector(".clearable-form .clear-form");

  if (clearFormButton) {
    clearFormButton.addEventListener("click", e => {
      e.preventDefault();
      document.querySelectorAll(".clearable-form .field input").forEach(input => {
        input.value = "";
      });
    });
  }
});
