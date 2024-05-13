````html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Questionnaire</title>
</head>
<body>
    <h2>You need to identify which server is the PDC emulator for the domain.</h2>
    <p><strong>Solution:</strong> From Active Directory Domains and Trusts, you right-click Active Directory Domains and Trusts in the console tree, and then select Operations Master.</p>

    <form action="#">
        <fieldset>
            <legend>Does this meet the goal?</legend>
            <input type="checkbox" id="yes" name="answer" value="yes">
            <label for="yes">A. Yes</label><br>
            <input type="checkbox" id="no" name="answer" value="no">
            <label for="no">B. No</label><br>
        </fieldset>
    </form>

    <button id="showSolution">Solution</button>

    <script>
        document.getElementById('showSolution').addEventListener('click', function() {
            alert("Solution: From Active Directory Domains and Trusts, you right-click Active Directory Domains and Trusts in the console tree, and then select Operations Master.");
        });
    </script>
</body>
</html>
````html
