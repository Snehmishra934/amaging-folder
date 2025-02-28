<html>
<head>
    <title>Age Calculator</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"></link>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
</head>
<body class="bg-gray-100 font-roboto">
    <div class="min-h-screen flex items-center justify-center">
        <div class="bg-white p-8 rounded-lg shadow-lg w-full max-w-md">
            <h1 class="text-2xl font-bold mb-6 text-center">Age Calculator</h1>
            <form id="ageForm" class="space-y-4">
                <div>
                    <label for="birthdate" class="block text-sm font-medium text-gray-700">Enter your birthdate:</label>
                    <input type="date" id="birthdate" name="birthdate" class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">
                </div>
                <div class="text-center">
                    <button type="button" onclick="calculateAge()" class="w-full inline-flex justify-center py-2 px-4 border border-transparent shadow-sm text-sm font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                        Calculate Age
                    </button>
                </div>
            </form>
            <div id="result" class="mt-6 text-center text-lg font-semibold text-gray-700"></div>
        </div>
    </div>

    <script>
        function calculateAge() {
            const birthdate = document.getElementById('birthdate').value;
            if (!birthdate) {
                document.getElementById('result').innerText = "Please enter your birthdate.";
                return;
            }

            const birthDate = new Date(birthdate);
            const today = new Date();
            let age = today.getFullYear() - birthDate.getFullYear();
            const monthDifference = today.getMonth() - birthDate.getMonth();

            if (monthDifference < 0 || (monthDifference === 0 && today.getDate() < birthDate.getDate())) {
                age--;
            }

            document.getElementById('result').innerText = `You are ${age} years old.`;
        }
    </script>
</body>
</html>
