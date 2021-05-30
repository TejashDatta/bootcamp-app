document.addEventListener("turbolinks:load", () => {
  let checkAllButton = document.querySelector(".check-all");
  let uncheckAllButton = document.querySelector(".uncheck-all");

  if (checkAllButton)
    addCheckboxControlListener(checkAllButton, true)

  if (uncheckAllButton)
    addCheckboxControlListener(uncheckAllButton, false)
});

function addCheckboxControlListener(button, checkboxValue) {
  button.addEventListener("click", e => {
    document.querySelectorAll("input[type=\"checkbox\"].bulk-check").forEach(checkbox => {
      checkbox.checked = checkboxValue;
    });
  });
}
