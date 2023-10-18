use obi::{OBIDecode, OBIEncode, OBISchema};
use owasm_kit::{execute_entry_point, ext, oei, prepare_entry_point};

#[derive(OBIDecode, OBISchema)]
struct Input { word: String }

#[derive(OBIEncode, OBISchema)]
struct Output { result: String }

fn prepare_impl(input: Input) {
    if input.word.is_empty() { panic!("Error: word is empty"); }
    oei::ask_external_data(1, 6, input.word.as_bytes());
}

fn execute_impl(_: Input) -> Output {
    Output { result: ext::load_majority::<String>(1).unwrap() }
}

prepare_entry_point!(prepare_impl);
execute_entry_point!(execute_impl);
