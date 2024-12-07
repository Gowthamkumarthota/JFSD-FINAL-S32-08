// Initialize Charts when DOM is loaded
document.addEventListener('DOMContentLoaded', function() {
    // Performance Chart
    const performanceCtx = document.getElementById('performanceChart').getContext('2d');
    new Chart(performanceCtx, {
        type: 'line',
        data: {
            labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
            datasets: [{
                label: 'Academic Performance',
                data: [85, 88, 82, 90, 85, 88],
                borderColor: '#4a90e2',
                tension: 0.4,
                fill: false
            }]
        },
        options: {
            responsive: true,
            plugins: {
                legend: {
                    display: false
                }
            },
            scales: {
                y: {
                    beginAtZero: true,
                    max: 100
                }
            }
        }
    });

    // Attendance Overview Chart
    const attendanceCtx = document.getElementById('attendanceOverview').getContext('2d');
    new Chart(attendanceCtx, {
        type: 'doughnut',
        data: {
            labels: ['Present', 'Absent', 'Late'],
            datasets: [{
                data: [85, 10, 5],
                backgroundColor: ['#2ecc71', '#e74c3c', '#f1c40f']
            }]
        },
        options: {
            responsive: true,
            plugins: {
                legend: {
                    position: 'bottom'
                }
            }
        }
    });
});

// Update charts with real data when available
function updatePerformanceChart(data) {
    // Implementation for updating performance chart with real data
}

function updateAttendanceChart(data) {
    // Implementation for updating attendance chart with real data
}