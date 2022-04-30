from requests import get
import platform
import os
import psutil
import GPUtil


app = Flask(__name__)
@app.route('/', methods=['GET'])
def welcome():
    return data





if __name__ == '__main__':
    Tm = str((datetime.now().strftime('%Y-%m-%d %H:%M:%S')))
    Tm = "Server time is: " + Tm

    InternalIP = str(socket.gethostbyname(socket.gethostname()))
    InternalIP = "Server InternalIP is: " + InternalIP



    ip = get('https://api.ipify.org').content.decode('utf8')
    ExternalIP = ('Server public IP address is: {}'.format(ip))

    CPU_Model = "Server CPU Model is: " + platform.machine()
    print(CPU_Model)

    CPU_Cores = "Server number of CPU Cores is: " + str(os.cpu_count())

    gpus = GPUtil.getGPUs()
    GpuA=""
    if gpus:
        for gpu in gpus:
            GpuA=str(gpu.name)
    else:
        GpuA="No GPUs"
    GPU_Type = "Server GPU Type is: " + GpuA

    Memory = "Server size of the Memory is: " + str((psutil.virtual_memory()[0])/1024/1024/1024)[0:4] + "Gb"

    data = Tm + "<br/>" + InternalIP + "<br/>" + ExternalIP + "<br/>" + CPU_Model + "<br/>" + CPU_Cores + "<br/>" + GPU_Type + "<br/>" + Memory
    
    # data = Tm + "\n" + InternalIP + "\n" + ExternalIP + "\n" + CPU_Model + "\n" + CPU_Cores + "\n" + GPU_Type + "\n" + Memory

    app.run(host='0.0.0.0', port=80)  
