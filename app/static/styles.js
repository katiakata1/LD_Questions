document.addEventListener("DOMContentLoaded", function() {
    // Get input field and cursor elements
    const inputField = document.getElementById("entry");
    const cursor = document.querySelector(".cursor");

    // Add event listener for input events
    inputField.addEventListener("input", handleInput);

    // Focus on the input field when the page loads
    inputField.focus();

    // Function to handle input events
    function handleInput() {
        // Show cursor
        cursor.style.display = "block";

        // Restart animation by reassigning class
        cursor.classList.remove("cursorBlink");
        void cursor.offsetWidth; // Trigger reflow
        cursor.classList.add("cursorBlink");
    }

    // Check if the user is on a mobile device
    const isMobileDevice = /Mobi|Android/i.test(navigator.userAgent);

    // If the user is on a mobile device, focus on the input field after a short delay
    if (isMobileDevice) {
        setTimeout(() => {
            inputField.focus();
        }, 500); // Adjust the delay as needed
    }
});

