get_filename_component(ADDON_ROOT ${CMAKE_CURRENT_LIST_FILE} PATH)
get_filename_component(ADDON_NAME ${ADDON_ROOT} NAME)

message(STATUS "-------------------------------- Configuring OF Addon '${ADDON_NAME}'")

set(ADDON_SRC 
    # insert source files with ${ADDON_ROOT} as base (${ADDON_ROOT}/src/ofxAwesomeAddon.cpp)
    ${ADDON_ROOT}/src/DSP/helpers/UsesSlew.cpp
    ${ADDON_ROOT}/src/DSP/helpers/FFTWorker.cpp
    ${ADDON_ROOT}/src/DSP/oscillators/phasors/PMPhasor.cpp
    ${ADDON_ROOT}/src/DSP/oscillators/phasors/PhasorShifter.cpp
    ${ADDON_ROOT}/src/DSP/oscillators/phasors/LFOPhasor.cpp
    ${ADDON_ROOT}/src/DSP/oscillators/phasors/ClockedPhasor.cpp
    ${ADDON_ROOT}/src/DSP/oscillators/cheap/CheapSine.cpp
    ${ADDON_ROOT}/src/DSP/oscillators/cheap/CheapSaw.cpp
    ${ADDON_ROOT}/src/DSP/oscillators/cheap/CheapTri.cpp
    ${ADDON_ROOT}/src/DSP/oscillators/cheap/CheapPulse.cpp
    ${ADDON_ROOT}/src/DSP/oscillators/antialiased/BLEPSaw.cpp
    ${ADDON_ROOT}/src/DSP/oscillators/antialiased/DPWTri.cpp
    ${ADDON_ROOT}/src/DSP/oscillators/antialiased/BLEP/BLEPBased.cpp
    ${ADDON_ROOT}/src/DSP/oscillators/antialiased/BLEP/BLEPTable.cpp
    ${ADDON_ROOT}/src/DSP/oscillators/fm/SineFB.cpp
    ${ADDON_ROOT}/src/DSP/oscillators/wavetable/WaveTable.cpp
    ${ADDON_ROOT}/src/DSP/oscillators/wavetable/DataOsc.cpp
    ${ADDON_ROOT}/src/DSP/oscillators/wavetable/WaveTableOsc.cpp
    ${ADDON_ROOT}/src/DSP/oscillators/wavetable/DataTable.cpp
    ${ADDON_ROOT}/src/DSP/oscillators/base/Oscillator.cpp
    ${ADDON_ROOT}/src/DSP/oscillators/base/OscillatorVariShape.cpp
    ${ADDON_ROOT}/src/DSP/signal/Saturator1.cpp
    ${ADDON_ROOT}/src/DSP/signal/SoftClip.cpp
    ${ADDON_ROOT}/src/DSP/signal/Bitcruncher.cpp
    ${ADDON_ROOT}/src/DSP/signal/Saturator2.cpp
    ${ADDON_ROOT}/src/DSP/signal/SampleAndHold.cpp
    ${ADDON_ROOT}/src/DSP/signal/Decimator.cpp
    ${ADDON_ROOT}/src/DSP/convolution/FDLConvolver.cpp
    ${ADDON_ROOT}/src/DSP/filters/APF1.cpp
    ${ADDON_ROOT}/src/DSP/filters/biquads/BiquadLowShelf.cpp
    ${ADDON_ROOT}/src/DSP/filters/biquads/BiquadBase.cpp
    ${ADDON_ROOT}/src/DSP/filters/biquads/BiquadHighShelf.cpp
    ${ADDON_ROOT}/src/DSP/filters/biquads/BiquadLPF2.cpp
    ${ADDON_ROOT}/src/DSP/filters/biquads/BiquadPeakEQ.cpp
    ${ADDON_ROOT}/src/DSP/filters/biquads/BiquadHPF2.cpp
    ${ADDON_ROOT}/src/DSP/filters/SVF2.cpp
    ${ADDON_ROOT}/src/DSP/filters/APF4.cpp
    ${ADDON_ROOT}/src/DSP/filters/OnePole.cpp
    ${ADDON_ROOT}/src/DSP/filters/MultiLadder4.cpp
    ${ADDON_ROOT}/src/DSP/samplers/GrainWindow.cpp
    ${ADDON_ROOT}/src/DSP/samplers/Sampler.cpp
    ${ADDON_ROOT}/src/DSP/samplers/grain/GrainTable.cpp
    ${ADDON_ROOT}/src/DSP/samplers/grain/GrainBased.cpp
    ${ADDON_ROOT}/src/DSP/samplers/SampleBuffer.cpp
    ${ADDON_ROOT}/src/DSP/resamplers/UpSampler.cpp
    ${ADDON_ROOT}/src/DSP/resamplers/DownSampler.cpp
    ${ADDON_ROOT}/src/DSP/resamplers/ZeroDownSampler.cpp
    ${ADDON_ROOT}/src/DSP/resamplers/BandLimit.cpp
    ${ADDON_ROOT}/src/DSP/resamplers/ZeroUpSampler.cpp
    ${ADDON_ROOT}/src/DSP/resamplers/IIRUpSampler2x.cpp
    ${ADDON_ROOT}/src/DSP/resamplers/IIRDownSampler2x.cpp
    ${ADDON_ROOT}/src/DSP/core/Switch.cpp
    ${ADDON_ROOT}/src/DSP/core/Amp.cpp
    ${ADDON_ROOT}/src/DSP/core/Formula.cpp
    ${ADDON_ROOT}/src/DSP/core/operators.cpp
    ${ADDON_ROOT}/src/DSP/core/BufferShell.cpp
    ${ADDON_ROOT}/src/DSP/core/Preparable.cpp
    ${ADDON_ROOT}/src/DSP/core/BasicNodes.cpp
    ${ADDON_ROOT}/src/DSP/core/PatchNode.cpp
    ${ADDON_ROOT}/src/DSP/core/leftSum.cpp
    ${ADDON_ROOT}/src/DSP/core/Processor.cpp
    ${ADDON_ROOT}/src/DSP/core/ExternalInput.cpp
    ${ADDON_ROOT}/src/DSP/envelopes/AHR.cpp
    ${ADDON_ROOT}/src/DSP/envelopes/ADSR.cpp
    ${ADDON_ROOT}/src/DSP/envelopes/stages/EnvelopeStage.cpp
    ${ADDON_ROOT}/src/DSP/dynamics/AbsoluteValue.cpp
    ${ADDON_ROOT}/src/DSP/dynamics/RMSDetector.cpp
    ${ADDON_ROOT}/src/DSP/dynamics/EnvelopeFollower.cpp
    ${ADDON_ROOT}/src/DSP/dynamics/SquarePeakDetector.cpp
    ${ADDON_ROOT}/src/DSP/dynamics/LHDelay.cpp
    ${ADDON_ROOT}/src/DSP/dynamics/GainComputer.cpp
    ${ADDON_ROOT}/src/DSP/dynamics/PositiveValue.cpp
    ${ADDON_ROOT}/src/DSP/random/WhiteNoise.cpp
    ${ADDON_ROOT}/src/DSP/random/TriggeredRandom.cpp
    ${ADDON_ROOT}/src/DSP/control/TriggerControl.cpp
    ${ADDON_ROOT}/src/DSP/control/SequencerGateOutput.cpp
    ${ADDON_ROOT}/src/DSP/control/TriggerGeiger.cpp
    ${ADDON_ROOT}/src/DSP/control/SequencerValueOutput.cpp
    ${ADDON_ROOT}/src/DSP/control/ValueControl.cpp
    ${ADDON_ROOT}/src/DSP/control/SequencerBridge.cpp
    ${ADDON_ROOT}/src/DSP/control/ToGateTrigger.cpp
    ${ADDON_ROOT}/src/DSP/utility/SamplesDelay.cpp
    ${ADDON_ROOT}/src/DSP/utility/PitchToFreq.cpp
    ${ADDON_ROOT}/src/DSP/utility/OneBarTimeMs.cpp
    ${ADDON_ROOT}/src/DSP/utility/DBtoLin.cpp
    ${ADDON_ROOT}/src/DSP/utility/LinToDB.cpp
    ${ADDON_ROOT}/src/DSP/utility/MaxValue.cpp
    ${ADDON_ROOT}/src/DSP/utility/BipolarToUnipolar.cpp
    ${ADDON_ROOT}/src/DSP/utility/FreqToMs.cpp
    ${ADDON_ROOT}/src/DSP/utility/OneMinusInput.cpp
    ${ADDON_ROOT}/src/DSP/delays/AllPassDelay.cpp
    ${ADDON_ROOT}/src/DSP/delays/SRDelay.cpp
    ${ADDON_ROOT}/src/DSP/delays/Delay.cpp
    ${ADDON_ROOT}/src/ofx/MidiControls.cpp
    ${ADDON_ROOT}/src/ofx/SerialOut.cpp
    ${ADDON_ROOT}/src/ofx/helper/MidiKeysBuffers.cpp
    ${ADDON_ROOT}/src/ofx/helper/SequencerSectionPlotter.cpp
    ${ADDON_ROOT}/src/ofx/helper/EngineGraphics.cpp
    ${ADDON_ROOT}/src/ofx/helper/MidiCCBuffers.cpp
    ${ADDON_ROOT}/src/ofx/ComputerKeyboard.cpp
    ${ADDON_ROOT}/src/ofx/Scope.cpp
    ${ADDON_ROOT}/src/ofx/Parameter.cpp
    ${ADDON_ROOT}/src/ofx/ParameterGain.cpp
    ${ADDON_ROOT}/src/ofx/OscInput.cpp
    ${ADDON_ROOT}/src/ofx/MidiKeys.cpp
    ${ADDON_ROOT}/src/ofx/OscOutput.cpp
    ${ADDON_ROOT}/src/ofx/SampleBufferPlotter.cpp
    ${ADDON_ROOT}/src/ofx/MidiPads.cpp
    ${ADDON_ROOT}/src/ofx/MidiIn.cpp
    ${ADDON_ROOT}/src/ofx/MidiOut.cpp
    ${ADDON_ROOT}/src/ofx/ofxPDSPFunctions.cpp
    ${ADDON_ROOT}/src/ofx/ParameterAmp.cpp
    ${ADDON_ROOT}/src/ofx/Wrapper.cpp
    ${ADDON_ROOT}/src/ofx/Engine.cpp
    ${ADDON_ROOT}/src/math/dsphelpers/incrementCalculator.cpp
    ${ADDON_ROOT}/src/math/dsphelpers/sanity_check.cpp
    ${ADDON_ROOT}/src/math/random/random.cpp
    ${ADDON_ROOT}/src/math/tables/blep.cpp
    ${ADDON_ROOT}/src/math/tables/dsp_windows.cpp
    ${ADDON_ROOT}/src/math/simd/core/allocator.cpp
    ${ADDON_ROOT}/src/math/simd/core/activate.cpp
    ${ADDON_ROOT}/src/modules/oscillators/VAOscillator.cpp
    ${ADDON_ROOT}/src/modules/oscillators/ClockedLFO.cpp
    ${ADDON_ROOT}/src/modules/oscillators/TableOscillator.cpp
    ${ADDON_ROOT}/src/modules/oscillators/LFO.cpp
    ${ADDON_ROOT}/src/modules/oscillators/FMOperator.cpp
    ${ADDON_ROOT}/src/modules/oscillators/DataOscillator.cpp
    ${ADDON_ROOT}/src/modules/signal/Panner.cpp
    ${ADDON_ROOT}/src/modules/signal/LinearCrossfader.cpp
    ${ADDON_ROOT}/src/modules/reverbs/BasiVerb.cpp
    ${ADDON_ROOT}/src/modules/reverbs/IRVerb.cpp
    ${ADDON_ROOT}/src/modules/sources/BitNoise.cpp
    ${ADDON_ROOT}/src/modules/equalizers/LowCut.cpp
    ${ADDON_ROOT}/src/modules/equalizers/AALowShelfEQ.cpp
    ${ADDON_ROOT}/src/modules/equalizers/HighShelfEQ.cpp
    ${ADDON_ROOT}/src/modules/equalizers/LowShelfEQ.cpp
    ${ADDON_ROOT}/src/modules/equalizers/PeakEQ.cpp
    ${ADDON_ROOT}/src/modules/equalizers/AAHighShelfEQ.cpp
    ${ADDON_ROOT}/src/modules/equalizers/HighCut.cpp
    ${ADDON_ROOT}/src/modules/equalizers/AAPeakEQ.cpp
    ${ADDON_ROOT}/src/modules/filters/PhaserFilter.cpp
    ${ADDON_ROOT}/src/modules/filters/SVFilter.cpp
    ${ADDON_ROOT}/src/modules/filters/VAFilter.cpp
    ${ADDON_ROOT}/src/modules/filters/CombFilter.cpp
    ${ADDON_ROOT}/src/modules/samplers/GrainCloud.cpp
    ${ADDON_ROOT}/src/modules/samplers/TriggeredGrain.cpp
    ${ADDON_ROOT}/src/modules/dynamics/Ducker.cpp
    ${ADDON_ROOT}/src/modules/dynamics/Compressor.cpp
    ${ADDON_ROOT}/src/modules/effects/DimensionChorus.cpp
    ${ADDON_ROOT}/src/messages/Clockable.cpp
    ${ADDON_ROOT}/src/messages/MessageBuffer.cpp
    ${ADDON_ROOT}/src/sequencer/SequencerMessage.cpp
    ${ADDON_ROOT}/src/sequencer/stockBehaviors.cpp
    ${ADDON_ROOT}/src/sequencer/SequencerSection.cpp
    ${ADDON_ROOT}/src/sequencer/SequencerProcessor.cpp
    ${ADDON_ROOT}/src/sequencer/Sequence.cpp
    ${ADDON_ROOT}/libs/audiofft/AudioFFT.cpp
)
set(ADDON_HDR
   # not used, but where supposed to be only header filenames without path for installation. Now solved with cmake filters.
)

add_library(${ADDON_NAME} 
    ${ADDON_SRC}
)
add_library(OF::${ADDON_NAME} ALIAS ${ADDON_NAME})
add_dependencies(${ADDON_NAME} openframeworks)

target_link_libraries(${ADDON_NAME} 
    openframeworks
    ofxMidi
    ofxAudioFile
    ofxOsc
    # system libraries either by their linkname (-lfoo) 
    # or by the variable defined by find modules in parents (${FOO_LIBRARIES})
)
target_include_directories(${ADDON_NAME}
    PUBLIC
	$<INSTALL_INTERFACE:include/addons/${ADDON_NAME}>
        $<BUILD_INTERFACE:${openFrameworks_DIR}/addons/${ADDON_NAME}/src/>
        $<BUILD_INTERFACE:${openFrameworks_DIR}/addons/${ADDON_NAME}/libs/>
        # include directories in addon tree must be referenced like above
        # system include directories by their full path (/usr/include/foo)
)

install(TARGETS ${ADDON_NAME}
    EXPORT ${ADDON_NAME}-targets
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
)

install(DIRECTORY
	$<BUILD_INTERFACE:${openFrameworks_DIR}/addons/${ADDON_NAME}/src/>
        $<BUILD_INTERFACE:${openFrameworks_DIR}/addons/${ADDON_NAME}/libs/>
    	DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/addons/${ADDON_NAME}/
	FILES_MATCHING PATTERN "*.h"
)

set(OFADDON_TARGETS ${OFADDON_TARGETS} ${ADDON_NAME} PARENT_SCOPE)
