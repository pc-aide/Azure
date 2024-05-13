<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Questionnaire</title>
    <style>
        .highlight {
            background-color: yellow;
        }

        #solutionInfo {
            display: none; /* Cacher par défaut */
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <h1>Question 1</h1>
    <h2>Your network contains an Active Directory Domain Services (AD DS) domain named contoso.com. You need to identify which server is the PDC emulator for the domain.</h2>
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

    <div id="solutionInfo"></div> <!-- Div pour afficher la réponse -->

    <button id="showSolution">Solution</button>

    <script>
        document.getElementById('showSolution').addEventListener('click', function() {
            // Récupérer la réponse sélectionnée
            var answer = document.querySelector('input[name="answer"]:checked');
            if (answer && answer.value === 'no') { // Vérifier si la réponse est "B. No"
                var answerText = answer.nextElementSibling.textContent.trim();
                var highlightedAnswer = document.createElement('div');
                highlightedAnswer.textContent = answerText;
                highlightedAnswer.classList.add('highlight'); // Ajouter la classe de surlignage
                document.getElementById('solutionInfo').textContent = ""; // Effacer tout contenu précédent
                document.getElementById('solutionInfo').appendChild(highlightedAnswer); // Afficher la réponse au-dessus du bouton Solution
                document.getElementById('solutionInfo').style.display = 'block'; // Afficher l'info
            }
        });
    </script>
</body>
</html>
