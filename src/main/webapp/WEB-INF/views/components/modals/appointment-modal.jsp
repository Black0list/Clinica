<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="../../components/includes/layout-head.jsp">
    <jsp:param name="title" value="Book Appointment" />
</jsp:include>

<div class="flex">
    <jsp:include page="../../components/includes/patientSideBar.jsp">
        <jsp:param name="active" value="appointments" />
    </jsp:include>

    <div class="flex-1 md:ml-64">
        <jsp:include page="../../components/includes/header.jsp" />

        <main class="p-6 max-w-3xl mx-auto">
            <div class="flex items-center justify-between mb-10">
                <div class="flex items-center w-full">
                    <div class="flex-1 text-center relative">
                        <div id="progress1" class="w-10 h-10 mx-auto rounded-full bg-primary-600 text-white flex items-center justify-center text-lg font-semibold transition-all">1</div>
                        <p class="mt-2 text-sm text-gray-600 dark:text-gray-400">Doctor</p>
                    </div>
                    <div class="flex-1 h-1 bg-gray-300 dark:bg-gray-700 mx-2 relative">
                        <div id="line1" class="absolute top-0 left-0 h-1 bg-primary-600 w-0 transition-all"></div>
                    </div>
                    <div class="flex-1 text-center relative">
                        <div id="progress2" class="w-10 h-10 mx-auto rounded-full bg-gray-300 text-gray-700 flex items-center justify-center text-lg font-semibold transition-all">2</div>
                        <p class="mt-2 text-sm text-gray-600 dark:text-gray-400">Date & Time</p>
                    </div>
                    <div class="flex-1 h-1 bg-gray-300 dark:bg-gray-700 mx-2 relative">
                        <div id="line2" class="absolute top-0 left-0 h-1 bg-primary-600 w-0 transition-all"></div>
                    </div>
                    <div class="flex-1 text-center relative">
                        <div id="progress3" class="w-10 h-10 mx-auto rounded-full bg-gray-300 text-gray-700 flex items-center justify-center text-lg font-semibold transition-all">3</div>
                        <p class="mt-2 text-sm text-gray-600 dark:text-gray-400">Confirm</p>
                    </div>
                </div>
            </div>

            <form method="post" action="${pageContext.request.contextPath}/patient/appointments/create" id="appointmentWizard" class="space-y-10">

                <section id="step1" class="space-y-6">
                    <h2 class="text-2xl font-bold text-gray-900 dark:text-white">1. Choose Doctor by Specialty</h2>
                    <div>
                        <label class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">Specialty</label>
                        <select id="specialtySelect" class="w-full px-3 py-2.5 border border-gray-300 dark:border-gray-600 rounded-lg bg-white dark:bg-gray-700 text-gray-900 dark:text-white focus:ring-2 focus:ring-primary-500 focus:border-primary-500" required>
                            <option value="">Select specialty</option>
                            <c:forEach var="spec" items="${specialties}">
                                <option value="${spec.name}">${spec.name}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div>
                        <label class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">Doctor</label>
                        <select name="doctorId" id="doctorSelect" class="w-full px-3 py-2.5 border border-gray-300 dark:border-gray-600 rounded-lg bg-white dark:bg-gray-700 text-gray-900 dark:text-white focus:ring-2 focus:ring-primary-500 focus:border-primary-500" required disabled>
                            <option value="">Select doctor</option>
                        </select>
                    </div>

                    <div class="flex justify-end">
                        <button type="button" onclick="goToStep(2)" id="toStep2" class="px-5 py-2 bg-primary-600 text-white rounded-lg hover:bg-primary-700 transition disabled:opacity-50" disabled>Next</button>
                    </div>
                </section>

                <section id="step2" class="hidden space-y-6">
                    <h2 class="text-2xl font-bold text-gray-900 dark:text-white">2. Choose Date and Time</h2>
                    <div>
                        <label class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">Date</label>
                        <input type="date" name="date" id="appointmentDate" class="w-full px-3 py-2.5 border border-gray-300 dark:border-gray-600 rounded-lg bg-white dark:bg-gray-700 text-gray-900 dark:text-white focus:ring-2 focus:ring-primary-500 focus:border-primary-500" required>
                    </div>

                    <div class="text-sm text-gray-700 dark:text-gray-300">Day: <span id="selectedDay" class="font-semibold"></span></div>

                    <div id="timeSlots" class="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 gap-3"></div>

                    <div class="flex justify-between">
                        <button type="button" onclick="goToStep(1)" class="px-5 py-2 bg-gray-300 dark:bg-gray-700 text-gray-800 dark:text-white rounded-lg hover:bg-gray-400 dark:hover:bg-gray-600 transition">Back</button>
                        <button type="button" onclick="goToStep(3)" id="toStep3" class="px-5 py-2 bg-primary-600 text-white rounded-lg hover:bg-primary-700 transition disabled:opacity-50" disabled>Next</button>
                    </div>
                </section>

                <section id="step3" class="hidden space-y-6">
                    <h2 class="text-2xl font-bold text-gray-900 dark:text-white">3. Confirm Appointment</h2>

                    <div class="bg-gray-50 dark:bg-gray-800 p-4 rounded-lg space-y-2 text-gray-800 dark:text-gray-200">
                        <p><strong>Doctor:</strong> <span id="confirmDoctor"></span></p>
                        <p><strong>Specialty:</strong> <span id="confirmSpecialty"></span></p>
                        <p><strong>Date:</strong> <span id="confirmDate"></span></p>
                        <p><strong>Day:</strong> <span id="confirmDay"></span></p>
                        <p><strong>Time:</strong> <span id="confirmTime"></span></p>
                    </div>

                    <div class="flex justify-between">
                        <button type="button" onclick="goToStep(2)" class="px-5 py-2 bg-gray-300 dark:bg-gray-700 text-gray-800 dark:text-white rounded-lg hover:bg-gray-400 dark:hover:bg-gray-600 transition">Back</button>
                        <button type="submit" class="px-5 py-2 bg-green-600 text-white rounded-lg hover:bg-green-700 transition">Confirm Appointment</button>
                    </div>
                </section>

            </form>
        </main>
    </div>
</div>

<jsp:include page="../../components/includes/layout-footer.jsp" />

<script>
    const steps = ["step1","step2","step3"];
    function goToStep(step) {
        steps.forEach((s,i)=>document.getElementById(s).classList.toggle("hidden",(i+1)!==step));
        document.getElementById("progress1").className = step>=1?"w-10 h-10 mx-auto rounded-full bg-primary-600 text-white flex items-center justify-center text-lg font-semibold transition-all":"w-10 h-10 mx-auto rounded-full bg-gray-300 text-gray-700 flex items-center justify-center text-lg font-semibold transition-all";
        document.getElementById("progress2").className = step>=2?"w-10 h-10 mx-auto rounded-full bg-primary-600 text-white flex items-center justify-center text-lg font-semibold transition-all":"w-10 h-10 mx-auto rounded-full bg-gray-300 text-gray-700 flex items-center justify-center text-lg font-semibold transition-all";
        document.getElementById("progress3").className = step>=3?"w-10 h-10 mx-auto rounded-full bg-primary-600 text-white flex items-center justify-center text-lg font-semibold transition-all":"w-10 h-10 mx-auto rounded-full bg-gray-300 text-gray-700 flex items-center justify-center text-lg font-semibold transition-all";
        document.getElementById("line1").style.width = step>=2?"100%":"0%";
        document.getElementById("line2").style.width = step>=3?"100%":"0%";
        if(step===3) updateSummary();
    }

    document.addEventListener("DOMContentLoaded",()=>document.getElementById("appointmentDate").setAttribute("min",new Date().toISOString().split("T")[0]));

    document.getElementById("specialtySelect").addEventListener("change",function(){
        const specialty=this.value;const doctorSelect=document.getElementById("doctorSelect");
        doctorSelect.innerHTML="<option value=''>Loading...</option>";doctorSelect.disabled=true;
        fetch(`${pageContext.request.contextPath}/doctors/specs?specialty=`+specialty)
            .then(res=>res.json()).then(doctorsNames=>{
            doctorSelect.innerHTML="<option value=''>Select doctor</option>";
            doctorsNames.forEach(doc=>{doctorSelect.innerHTML+="<option value='"+doc+"'>"+doc+"</option>";});
            doctorSelect.disabled=false;
        });
    });

    document.getElementById("doctorSelect").addEventListener("change",()=>document.getElementById("toStep2").disabled=!document.getElementById("doctorSelect").value);

    document.getElementById("appointmentDate").addEventListener("change",generateTimeSlots);

    function generateTimeSlots(){
        const container = document.getElementById("timeSlots");
        container.innerHTML = "";
        const times = [];
        let start = new Date();
        start.setHours(9, 0, 0, 0);
        for (let i = 0; i < 12; i++) {
            const time = new Date(start.getTime() + i * 35 * 60000);
            const hh = time.getHours().toString().padStart(2, '0');
            const mm = time.getMinutes().toString().padStart(2, '0');
            times.push(hh+":"+mm);
        }

        const date = document.getElementById("appointmentDate").value;
        const dayName = getDayName(date);

        function getDayName(dateString) {
            const days = ["SUNDAY","MONDAY","TUESDAY","WEDNESDAY","THURSDAY","FRIDAY","SATURDAY"];
            return days[new Date(dateString).getDay()];
        }

        console.log("/patient/appointments/occupied?doctorName=" + document.getElementById("doctorSelect").value + "&date=" + date + "&day=" + dayName);

        fetch("/patient/appointments/occupied?doctorName=" + document.getElementById("doctorSelect").value + "&date=" + date + "&day=" + dayName)
                .then(res => res.json())
            .then(data => {
                console.log(data)
                document.getElementById("selectedDay").textContent = data.day;
                times.forEach(t => {
                    const taken = data.occupied.includes(t);
                    container.innerHTML +=
                        "<button type='button' onclick=\"selectTime('" + t + "',event)\" " +
                        "class='px-3 py-2 rounded-lg w-full " + (taken ? "bg-red-500 text-white cursor-not-allowed opacity-70" : "bg-green-300 hover:bg-green-600 text-white") + "' " +
                        (taken ? "disabled" : "") + ">" +
                        t + (taken ? " (Taken)" : "") +
                        "</button>";
                    ;
                });
            });
    }


    let selectedTime=null;
    function selectTime(time,e){
        selectedTime=time;
        document.querySelectorAll("#timeSlots button").forEach(btn=>btn.classList.remove("ring-2","ring-primary-500"));
        e.target.classList.add("ring-2","ring-primary-500");
        let input=document.getElementById("hiddenTimeInput");
        if(!input){input=document.createElement("input");input.type="hidden";input.name="time";input.id="hiddenTimeInput";document.getElementById("appointmentWizard").appendChild(input);}
        input.value=time;
        document.getElementById("toStep3").disabled=false;
    }

    function updateSummary(){
        document.getElementById("confirmDoctor").textContent=document.getElementById("doctorSelect").selectedOptions[0].textContent;
        document.getElementById("confirmSpecialty").textContent=document.getElementById("specialtySelect").value;
        const date=document.getElementById("appointmentDate").value;
        document.getElementById("confirmDate").textContent=date;
        document.getElementById("confirmDay").textContent=document.getElementById("selectedDay").textContent;
        document.getElementById("confirmTime").textContent=selectedTime||"Not selected";
    }
</script>
