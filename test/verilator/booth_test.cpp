#include<iostream>
#include<verilated.h>
#include<verilated_vcd_c.h>
#include"Vbooth_test.h"
#include<stdlib.h>

vluint64_t main_time = 0;

int main(int argc, char** argv, char** env) {
    
    VerilatedContext*   m_contextp = new VerilatedContext;//环境
    // VerilatedVcdC*      m_tracep   = new VerilatedVcdC;//波形
    Vbooth_test*        m_dut      = new Vbooth_test;
    
    m_contextp->traceEverOn(true);
    // m_dut->trace(m_tracep,5);
    // m_tracep->open("wave.vcd");

    while(!m_contextp->gotFinish()){
        m_contextp->timeInc(1);
        m_dut->eval();
        // m_tracep->dump(m_contextp->time());
        // int a = rand();
        // int b = rand();
        // m_dut->multiplicand = a;
        // m_dut->multiplier = b;
        // m_dut->eval();
        // long c = m_dut->result
        // if(m_dut->result == a*b)
        //     std::cout << a <<"*"<< b <<"="<<m_dut << std::endl;
        // else {
        //     std::cout << a <<"*"<< b <<"!="<<m_dut << std::endl;
        //     break;
        // }
        // m_tracep->dump(test_num);
        // test_num++;
    }
    // m_tracep->close();
    delete m_dut;
    // delete m_tracep;
    delete m_contextp;
    return 0;
}